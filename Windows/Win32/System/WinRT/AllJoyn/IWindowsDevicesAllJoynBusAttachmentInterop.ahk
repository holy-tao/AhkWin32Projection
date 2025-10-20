#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * @namespace Windows.Win32.System.WinRT.AllJoyn
 * @version v4.0.30319
 */
class IWindowsDevicesAllJoynBusAttachmentInterop extends IInspectable{
    /**
     * The interface identifier for IWindowsDevicesAllJoynBusAttachmentInterop
     * @type {Guid}
     */
    static IID => Guid("{fd89c65b-b50e-4a19-9d0c-b42b783281cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Pointer<UInt64>} value 
     * @returns {HRESULT} 
     */
    get_Win32Handle(value) {
        result := ComCall(6, this, "uint*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
