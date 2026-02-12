#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CapturedFrame.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IOptionalReferencePhotoCapturedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOptionalReferencePhotoCapturedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{470f88b3-1e6d-4051-9c8b-f1d85af047b7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Frame", "get_Context"]

    /**
     * @type {CapturedFrame} 
     */
    Frame {
        get => this.get_Frame()
    }

    /**
     * @type {IInspectable} 
     */
    Context {
        get => this.get_Context()
    }

    /**
     * 
     * @returns {CapturedFrame} 
     */
    get_Frame() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CapturedFrame(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Context() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }
}
