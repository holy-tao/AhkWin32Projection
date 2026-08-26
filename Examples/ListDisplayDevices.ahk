#Requires AutoHotkey v2.0

#Import "..\Windows\Win32\Graphics\Gdi" { EnumDisplayDevicesW, DISPLAY_DEVICEW }

stdout := FileOpen("*", "w")

deviceNum := 0
deviceInfo := DISPLAY_DEVICEW()
deviceInfo.cb := ObjGetDataSize(deviceInfo)

while(EnumDisplayDevicesW(0, deviceNum++, deviceInfo, 0)) {
    deviceName := String(deviceInfo.DeviceName)
    deviceDesc := String(deviceInfo.DeviceString)

    ; Get device display name
    EnumDisplayDevicesW(deviceName, 0, deviceInfo, 0)

    stdout.WriteLine(Format("{1}: {2} - {3}", deviceName, deviceDesc, String(deviceInfo.DeviceString)))
}