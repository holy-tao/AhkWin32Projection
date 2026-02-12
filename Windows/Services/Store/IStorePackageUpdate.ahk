#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\ApplicationModel\Package.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStorePackageUpdate extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorePackageUpdate
     * @type {Guid}
     */
    static IID => Guid("{140fa150-3cbf-4a35-b91f-48271c31b072}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Package", "get_Mandatory"]

    /**
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * @type {Boolean} 
     */
    Mandatory {
        get => this.get_Mandatory()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Package(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Mandatory() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
