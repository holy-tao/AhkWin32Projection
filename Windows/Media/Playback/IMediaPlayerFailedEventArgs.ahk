#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class IMediaPlayerFailedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPlayerFailedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{2744e9b9-a7e3-4f16-bac4-7914ebc08301}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Error", "get_ExtendedErrorCode", "get_ErrorMessage"]

    /**
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * @type {HRESULT} 
     */
    ExtendedErrorCode {
        get => this.get_ExtendedErrorCode()
    }

    /**
     * @type {HSTRING} 
     */
    ErrorMessage {
        get => this.get_ErrorMessage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Error() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedErrorCode() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ErrorMessage() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
