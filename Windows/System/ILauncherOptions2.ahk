#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Storage\Search\StorageFileQueryResult.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ILauncherOptions2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILauncherOptions2
     * @type {Guid}
     */
    static IID => Guid("{3ba08eb4-6e40-4dce-a1a3-2f53950afb49}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TargetApplicationPackageFamilyName", "put_TargetApplicationPackageFamilyName", "get_NeighboringFilesQuery", "put_NeighboringFilesQuery"]

    /**
     * @type {HSTRING} 
     */
    TargetApplicationPackageFamilyName {
        get => this.get_TargetApplicationPackageFamilyName()
        set => this.put_TargetApplicationPackageFamilyName(value)
    }

    /**
     * @type {StorageFileQueryResult} 
     */
    NeighboringFilesQuery {
        get => this.get_NeighboringFilesQuery()
        set => this.put_NeighboringFilesQuery(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetApplicationPackageFamilyName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TargetApplicationPackageFamilyName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {StorageFileQueryResult} 
     */
    get_NeighboringFilesQuery() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFileQueryResult(value)
    }

    /**
     * 
     * @param {StorageFileQueryResult} value 
     * @returns {HRESULT} 
     */
    put_NeighboringFilesQuery(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
