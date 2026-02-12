#Requires AutoHotkey v2.0

#Include ../../Windows/Web/Http/HttpClient.ahk
#Include ../../Windows/Web/Http/Filters/HttpBaseProtocolFilter.ahk

filter := HttpBaseProtocolFilter()
client := HttpClient.Create(filter)

; Returns your public IP address: https://www.ipify.org/
response := client.GetStringAsync(Uri.CreateUri("https://api.ipify.org?format=json")).Await().ToString()

MsgBox(response)

; Error examples - `Await` throws synchronously, `AwaitWithCallback` returns the operation
; badUri := Uri.CreateUri("https://not.a.website.gov/something?else")
; client.GetStringAsync(badUri).Await()
; client.GetStringAsync(badUri).AwaitWithCallback((op) => op.ThrowIfFailed())