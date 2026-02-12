#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\RevocationAndRenewalItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class IRevocationAndRenewalInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRevocationAndRenewalInformation
     * @type {Guid}
     */
    static IID => Guid("{f3a1937b-2501-439e-a6e7-6fc95e175fcf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Items"]

    /**
     * @type {IVector<RevocationAndRenewalItem>} 
     */
    Items {
        get => this.get_Items()
    }

    /**
     * 
     * @returns {IVector<RevocationAndRenewalItem>} 
     */
    get_Items() {
        result := ComCall(6, this, "ptr*", &items := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(RevocationAndRenewalItem, items)
    }
}
