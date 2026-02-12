#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class ISystemAudioProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemAudioProperties
     * @type {Guid}
     */
    static IID => Guid("{3f8f38b7-308c-47e1-924d-8645348e5db7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EncodingBitrate"]

    /**
     * @type {HSTRING} 
     */
    EncodingBitrate {
        get => this.get_EncodingBitrate()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EncodingBitrate() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
