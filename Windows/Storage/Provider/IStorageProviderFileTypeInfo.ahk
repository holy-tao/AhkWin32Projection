#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderFileTypeInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderFileTypeInfo
     * @type {Guid}
     */
    static IID => Guid("{1955b9c1-0184-5a88-87df-4544f464365d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FileExtension", "get_IconResource"]

    /**
     * @type {HSTRING} 
     */
    FileExtension {
        get => this.get_FileExtension()
    }

    /**
     * @type {HSTRING} 
     */
    IconResource {
        get => this.get_IconResource()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FileExtension() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IconResource() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
