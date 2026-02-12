#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IVideoTrackSupportInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoTrackSupportInfo
     * @type {Guid}
     */
    static IID => Guid("{4bb534a0-fc5f-450d-8ff0-778d590486de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DecoderStatus", "get_MediaSourceStatus"]

    /**
     * @type {Integer} 
     */
    DecoderStatus {
        get => this.get_DecoderStatus()
    }

    /**
     * @type {Integer} 
     */
    MediaSourceStatus {
        get => this.get_MediaSourceStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DecoderStatus() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MediaSourceStatus() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
