#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the outcome of a Present call on a holographic frame.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframepresentresult
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicFramePresentResult extends Win32Enum{

    /**
     * The frame was presented successfully.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The Direct3D 11 device was removed and a new device is required. To investigate the cause of device removed errors, call the ID3D11Device::GetDeviceRemovedReason method before releasing the Direct3D device. Set the new device by calling the HolographicSpace::SetDirect3D11Device method.
     * @type {Integer (Int32)}
     */
    static DeviceRemoved => 1
}
