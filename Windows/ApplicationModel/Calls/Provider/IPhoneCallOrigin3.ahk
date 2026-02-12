#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\StorageFile.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls.Provider
 * @version WindowsRuntime 1.4
 */
class IPhoneCallOrigin3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneCallOrigin3
     * @type {Guid}
     */
    static IID => Guid("{49330fb4-d1a7-43a2-aeee-c07b6dbaf068}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayPicture", "put_DisplayPicture"]

    /**
     * @type {StorageFile} 
     */
    DisplayPicture {
        get => this.get_DisplayPicture()
        set => this.put_DisplayPicture(value)
    }

    /**
     * 
     * @returns {StorageFile} 
     */
    get_DisplayPicture() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFile(value)
    }

    /**
     * 
     * @param {StorageFile} value 
     * @returns {HRESULT} 
     */
    put_DisplayPicture(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
