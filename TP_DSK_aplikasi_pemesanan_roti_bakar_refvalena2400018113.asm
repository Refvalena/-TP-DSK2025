org 100h

start:
    jmp mulai

nama            db 13,10,'Nama Anda     : $'
telp            db 13,10,'No. Telp      : $'
  

tampungnama     db 30,?,30 dup(?)
tampuntelp      db 30,?,30 dup(?) 

daftar:
    db 13,10,'+------------------------------------------------------------+'  
    db 13,10,'|                     ROTI BAKAR REPA                        |'
    db 13,10,'+---+--------------------------------------------------------+'
    db 13,10,'|No |          DAFTAR RASA          |        HARGA           |'
    db 13,10,'+---+--------------------------------------------------------+'
    db 13,10,'|1. |          RASA COKLAT          |        15.000          |'
    db 13,10,'+---+--------------------------------------------------------+' 
    db 13,10,'|2. |          RASA KEJU            |        17.000          |'
    db 13,10,'+---+--------------------------------------------------------+'
    db 13,10,'|3. |          RASA COKLAT KEJU     |        20.000          |'
    db 13,10,'+---+--------------------------------------------------------+'
    db 13,10,'|4. |          RASA STRAWBERRY      |        15.000          |'
    db 13,10,'+---+--------------------------------------------------------+'
    db 13,10,'|5. |          RASA BLUEBERRY       |        15.000          |'
    db 13,10,'+---+--------------------------------------------------------+' 
    
lanjut           db 13,10,'LANJUT tekan y untuk lanjut >>>>>>>>>>>>>> $' 
pilih_no_rasa    db 13,10,'Silahkan masukkan nomor rasa yang Anda pilih: $'
error            db 13,10,'                                               '
success          db 13,10,'Pesanan anda akan segera dibuat $'


; Teks hasil
teks1   db 13,10,'Anda memilih rasa coklat', 13,10,'Total harga yang harus Anda bayar: 15.000', 13,10,'Terima kasih$', 0
teks2   db 13,10,'Anda memilih rasa keju', 13,10,'Total harga yang harus Anda bayar: 17.000', 13,10,'Terima kasih$', 0
teks3   db 13,10,'Anda memilih rasa coklat keju', 13,10,'Total harga yang harus Anda bayar: 20.000', 13,10,'Terima kasih$', 0
teks4   db 13,10,'Anda memilih rasa strawberry', 13,10,'Total harga yang harus Anda bayar: 15.000', 13,10,'Terima kasih$', 0
teks5   db 13,10,'Anda memilih rasa blueberry', 13,10,'Total harga yang harus Anda bayar: 15.000', 13,10,'Terima kasih$', 0         


mulai:
    mov ah, 09h
    lea dx, nama
    int 21h 
    mov ah, 0ah
    lea dx, tampungnama
    int 21h  

    mov ah, 09h
    lea dx, telp
    int 21h
    mov ah, 0ah
    lea dx, tampuntelp
    int 21h 

    mov ah, 09h
    lea dx, daftar
    int 21h

    mov ah, 09h 
    lea dx, lanjut
    int 21h   

    mov ah, 01h 
    int 21h
    cmp al, 'y'
    jne error_msg

proses:
    mov ah, 09h
    lea dx, pilih_no_rasa
    int 21h

    mov ah, 01h
    int 21h
    mov bh, al

    cmp bh, '1'
    je hasil1  
    cmp bh, '2'
    je hasil2
    cmp bh, '3'
    je hasil3
    cmp bh, '4'
    je hasil4
    cmp bh, '5'
    je hasil5

error_msg:
    mov ah, 09h
    lea dx, error
    int 21h
    int 20h

hasil1:
    mov ah, 09h
    lea dx, teks1
    int 21h
    int 20h  

hasil2:
    mov ah, 09h
    lea dx, teks2
    int 21h
    int 20h

hasil3:
    mov ah, 09h
    lea dx, teks3
    int 21h
    int 20h

hasil4:
    mov ah, 09h
    lea dx, teks4
    int 21h
    int 20h

hasil5:
    mov ah, 09h
    lea dx, teks5
    int 21h
    int 20h

end start
    