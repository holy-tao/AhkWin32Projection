#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Storage\StorageFile.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioFileInputNode extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioFileInputNode
     * @type {Guid}
     */
    static IID => Guid("{905b67c8-6f65-4cd4-8890-4694843c276d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_PlaybackSpeedFactor", "get_PlaybackSpeedFactor", "get_Position", "Seek", "get_StartTime", "put_StartTime", "get_EndTime", "put_EndTime", "get_LoopCount", "put_LoopCount", "get_Duration", "get_SourceFile", "add_FileCompleted", "remove_FileCompleted"]

    /**
     * @type {Float} 
     */
    PlaybackSpeedFactor {
        get => this.get_PlaybackSpeedFactor()
        set => this.put_PlaybackSpeedFactor(value)
    }

    /**
     * @type {TimeSpan} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    EndTime {
        get => this.get_EndTime()
        set => this.put_EndTime(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    LoopCount {
        get => this.get_LoopCount()
        set => this.put_LoopCount(value)
    }

    /**
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * @type {StorageFile} 
     */
    SourceFile {
        get => this.get_SourceFile()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PlaybackSpeedFactor(value) {
        result := ComCall(6, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PlaybackSpeedFactor() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Position() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Seek Method
     * @remarks
     * Use the **Seek** method in conjunction with the [Index](./index-property.md) property if the underlying provider supports indexes on the **Recordset** object. Use the [Supports](./supports-method.md)**(adSeek)** method to determine whether the underlying provider supports **Seek**, and the **Supports(adIndex)** method to determine whether the provider supports indexes. (For example, the [OLE DB Provider for Microsoft Jet](../../guide/appendixes/microsoft-ole-db-provider-for-microsoft-jet.md) supports **Seek** and **Index**.)  
     *   
     *  If **Seek** does not find the desired row, no error occurs, and the row is positioned at the end of the **Recordset**. Set the **Index** property to the desired index before executing this method.  
     *   
     *  This method is supported only with server-side cursors. Seek is not supported when the **Recordset** object's [CursorLocation](./cursorlocation-property-ado.md) property value is **adUseClient**.  
     *   
     *  This method can only be used when the **Recordset** object has been opened with a [CommandTypeEnum](./commandtypeenum.md) value of **adCmdTableDirect**.
     * @param {TimeSpan} position 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/seek-method
     */
    Seek(position) {
        result := ComCall(9, this, "ptr", position, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_StartTime() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_StartTime(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_EndTime() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_EndTime(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_LoopCount() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_LoopCount(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        value := TimeSpan()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {StorageFile} 
     */
    get_SourceFile() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFile(value)
    }

    /**
     * 
     * @param {TypedEventHandler<AudioFileInputNode, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FileCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(18, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FileCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(19, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
