#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\ITypeInfo.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides access to the type information for an object's coclass entry in its type library.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iprovideclassinfo
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IProvideClassInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProvideClassInfo
     * @type {Guid}
     */
    static IID => Guid("{b196b283-bab4-101a-b69c-00aa00341d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClassInfo"]

    /**
     * Retrieves a pointer to the ITypeInfo interface for the object's type information. The type information for an object corresponds to the object's coclass entry in a type library.
     * @returns {ITypeInfo} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a> pointer variable that receives the interface pointer to the object's type information. The caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the returned interface pointer if this method returns successfully.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iprovideclassinfo-getclassinfo
     */
    GetClassInfo() {
        result := ComCall(3, this, "ptr*", &ppTI := 0, "HRESULT")
        return ITypeInfo(ppTI)
    }
}
