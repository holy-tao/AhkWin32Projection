#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include .\MediaOverlay.ahk
#Include .\MediaClip.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class IMediaOverlay extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaOverlay
     * @type {Guid}
     */
    static IID => Guid("{a902ae5d-7869-4830-8ab1-94dc01c05fa4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Position", "put_Position", "put_Delay", "get_Delay", "get_Opacity", "put_Opacity", "Clone", "get_Clip", "get_AudioEnabled", "put_AudioEnabled"]

    /**
     * @type {RECT} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * @type {TimeSpan} 
     */
    Delay {
        get => this.get_Delay()
        set => this.put_Delay(value)
    }

    /**
     * @type {Float} 
     */
    Opacity {
        get => this.get_Opacity()
        set => this.put_Opacity(value)
    }

    /**
     * @type {MediaClip} 
     */
    Clip {
        get => this.get_Clip()
    }

    /**
     * @type {Boolean} 
     */
    AudioEnabled {
        get => this.get_AudioEnabled()
        set => this.put_AudioEnabled(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Position() {
        value := RECT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Delay(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Delay() {
        value := TimeSpan()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Opacity() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Opacity(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Clone Method Example (VC++)
     * @returns {MediaOverlay} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clone-method-example-vc
     */
    Clone() {
        result := ComCall(12, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaOverlay(result_)
    }

    /**
     * 
     * @returns {MediaClip} 
     */
    get_Clip() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaClip(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AudioEnabled() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_AudioEnabled(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
