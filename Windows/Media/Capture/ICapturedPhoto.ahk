#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CapturedFrame.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class ICapturedPhoto extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICapturedPhoto
     * @type {Guid}
     */
    static IID => Guid("{b0ce7e5a-cfcc-4d6c-8ad1-0869208aca16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Frame", "get_Thumbnail"]

    /**
     * @type {CapturedFrame} 
     */
    Frame {
        get => this.get_Frame()
    }

    /**
     * @type {CapturedFrame} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
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
     * @returns {CapturedFrame} 
     */
    get_Thumbnail() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CapturedFrame(value)
    }
}
