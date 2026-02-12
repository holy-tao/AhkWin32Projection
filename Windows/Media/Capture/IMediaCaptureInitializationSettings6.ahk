#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IMediaCaptureInitializationSettings6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaCaptureInitializationSettings6
     * @type {Guid}
     */
    static IID => Guid("{b2e26b47-3db1-4d33-ab63-0ffa09056585}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AlwaysPlaySystemShutterSound", "put_AlwaysPlaySystemShutterSound"]

    /**
     * @type {Boolean} 
     */
    AlwaysPlaySystemShutterSound {
        get => this.get_AlwaysPlaySystemShutterSound()
        set => this.put_AlwaysPlaySystemShutterSound(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AlwaysPlaySystemShutterSound() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AlwaysPlaySystemShutterSound(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
