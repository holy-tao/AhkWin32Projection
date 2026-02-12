#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\StorageFile.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.AppRecording
 * @version WindowsRuntime 1.4
 */
class IAppRecordingSavedScreenshotInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppRecordingSavedScreenshotInfo
     * @type {Guid}
     */
    static IID => Guid("{9b642d0a-189a-4d00-bf25-e1bb1249d594}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_File", "get_MediaEncodingSubtype"]

    /**
     * @type {StorageFile} 
     */
    File {
        get => this.get_File()
    }

    /**
     * @type {HSTRING} 
     */
    MediaEncodingSubtype {
        get => this.get_MediaEncodingSubtype()
    }

    /**
     * 
     * @returns {StorageFile} 
     */
    get_File() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFile(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MediaEncodingSubtype() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
