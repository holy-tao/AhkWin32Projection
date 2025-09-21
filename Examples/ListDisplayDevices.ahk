#Requires AutoHotkey v2.0

#Include ..\Windows\Win32\Graphics\Gdi\Apis.ahk
#Include ..\Windows\Win32\Graphics\Gdi\DISPLAY_DEVICEW.ahk

stdout := FileOpen("*", "w")

deviceNum := 0
deviceInfo := DISPLAY_DEVICEW()
deviceInfo.cb := DISPLAY_DEVICEW.sizeof

while(Gdi.EnumDisplayDevicesW(0, deviceNum++, deviceInfo, 0)) {
    deviceName := deviceInfo.DeviceName
    deviceDesc := deviceInfo.DeviceString

    ; Get device display name
    Gdi.EnumDisplayDevicesW(deviceName, 0, deviceInfo, 0)

    stdout.WriteLine(Format("{1}: {2} - {3}", deviceName, deviceDesc, deviceInfo.DeviceString))
}