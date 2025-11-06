#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IObjectWithPackageFullName extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectWithPackageFullName
     * @type {Guid}
     */
    static IID => Guid("{ed2aa515-602f-469c-a130-ce69fd0fa878}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPackageFullName"]

    /**
     * Gets the package full name for the specified process.
     * @returns {PWSTR} Type: <b>PWSTR</b>
     * 
     * The package full name.
     * @see https://docs.microsoft.com/windows/win32/api//appmodel/nf-appmodel-getpackagefullname
     */
    GetPackageFullName() {
        result := ComCall(3, this, "ptr*", &packageFullName := 0, "HRESULT")
        return packageFullName
    }
}
