#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Composition
 * @version v4.0.30319
 */
class ICompositionGraphicsDeviceInterop extends IUnknown{
    /**
     * The interface identifier for ICompositionGraphicsDeviceInterop
     * @type {Guid}
     */
    static IID => Guid("{a116ff71-f8bf-4c8a-9c98-70779a32a9c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} value 
     * @returns {HRESULT} 
     */
    GetRenderingDevice(value) {
        result := ComCall(3, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} value 
     * @returns {HRESULT} 
     */
    SetRenderingDevice(value) {
        result := ComCall(4, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
