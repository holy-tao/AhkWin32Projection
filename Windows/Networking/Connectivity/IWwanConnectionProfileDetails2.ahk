#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class IWwanConnectionProfileDetails2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWwanConnectionProfileDetails2
     * @type {Guid}
     */
    static IID => Guid("{7a754ede-a1ed-48b2-8e92-b460033d52e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IPKind", "get_PurposeGuids"]

    /**
     * @type {Integer} 
     */
    IPKind {
        get => this.get_IPKind()
    }

    /**
     * @type {IVectorView<Guid>} 
     */
    PurposeGuids {
        get => this.get_PurposeGuids()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IPKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Guid>} 
     */
    get_PurposeGuids() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetGuid(), value)
    }
}
