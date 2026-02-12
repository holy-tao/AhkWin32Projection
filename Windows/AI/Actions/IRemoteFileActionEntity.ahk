#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IRemoteFileActionEntity extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteFileActionEntity
     * @type {Guid}
     */
    static IID => Guid("{a5d8ec21-a2bd-545a-abfc-d7aa79fd0b81}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceId", "get_FileKind", "get_SourceUri", "get_FileId", "get_ContentType", "get_DriveId", "get_AccountId", "get_Extension"]

    /**
     * @type {HSTRING} 
     */
    SourceId {
        get => this.get_SourceId()
    }

    /**
     * @type {Integer} 
     */
    FileKind {
        get => this.get_FileKind()
    }

    /**
     * @type {Uri} 
     */
    SourceUri {
        get => this.get_SourceUri()
    }

    /**
     * @type {HSTRING} 
     */
    FileId {
        get => this.get_FileId()
    }

    /**
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
    }

    /**
     * @type {HSTRING} 
     */
    DriveId {
        get => this.get_DriveId()
    }

    /**
     * @type {HSTRING} 
     */
    AccountId {
        get => this.get_AccountId()
    }

    /**
     * @type {HSTRING} 
     */
    Extension {
        get => this.get_Extension()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FileKind() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_SourceUri() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FileId() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentType() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DriveId() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AccountId() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Extension() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
