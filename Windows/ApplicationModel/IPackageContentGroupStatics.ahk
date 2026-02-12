#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IPackageContentGroupStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageContentGroupStatics
     * @type {Guid}
     */
    static IID => Guid("{70ee7619-5f12-4b92-b9ea-6ccada13bc75}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RequiredGroupName"]

    /**
     * @type {HSTRING} 
     */
    RequiredGroupName {
        get => this.get_RequiredGroupName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RequiredGroupName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
