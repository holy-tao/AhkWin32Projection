#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class IHeadset extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHeadset
     * @type {Guid}
     */
    static IID => Guid("{3fd156ef-6925-3fa8-9181-029c5223ae3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CaptureDeviceId", "get_RenderDeviceId"]

    /**
     * @type {HSTRING} 
     */
    CaptureDeviceId {
        get => this.get_CaptureDeviceId()
    }

    /**
     * @type {HSTRING} 
     */
    RenderDeviceId {
        get => this.get_RenderDeviceId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CaptureDeviceId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RenderDeviceId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
