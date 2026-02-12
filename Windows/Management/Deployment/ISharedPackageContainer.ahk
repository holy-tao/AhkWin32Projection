#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\SharedPackageContainerMember.ahk
#Include .\UpdateSharedPackageContainerResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class ISharedPackageContainer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISharedPackageContainer
     * @type {Guid}
     */
    static IID => Guid("{177f1aa9-151e-5ef7-b1d9-2fba0b4b0d17}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Id", "GetMembers", "RemovePackageFamily", "ResetData"]

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
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
    get_Id() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<SharedPackageContainerMember>} 
     */
    GetMembers() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(SharedPackageContainerMember, result_)
    }

    /**
     * 
     * @param {HSTRING} packageFamilyName 
     * @param {UpdateSharedPackageContainerOptions} options 
     * @returns {UpdateSharedPackageContainerResult} 
     */
    RemovePackageFamily(packageFamilyName, options) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(9, this, "ptr", packageFamilyName, "ptr", options, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateSharedPackageContainerResult(result_)
    }

    /**
     * 
     * @returns {UpdateSharedPackageContainerResult} 
     */
    ResetData() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateSharedPackageContainerResult(result_)
    }
}
