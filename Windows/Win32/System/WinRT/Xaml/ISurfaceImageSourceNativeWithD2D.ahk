#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class ISurfaceImageSourceNativeWithD2D extends IUnknown{
    /**
     * The interface identifier for ISurfaceImageSourceNativeWithD2D
     * @type {Guid}
     */
    static IID => Guid("{54298223-41e1-4a41-9c08-02e8256864a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} device 
     * @returns {HRESULT} 
     */
    SetDevice(device) {
        result := ComCall(3, this, "ptr", device, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} updateRect 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Void>} updateObject 
     * @param {Pointer<POINT>} offset 
     * @returns {HRESULT} 
     */
    BeginDraw(updateRect, iid, updateObject, offset) {
        result := ComCall(4, this, "ptr", updateRect, "ptr", iid, "ptr", updateObject, "ptr", offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndDraw() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SuspendDraw() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResumeDraw() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
