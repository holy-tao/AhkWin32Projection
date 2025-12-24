#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IProvideClassInfo2.ahk

/**
 * An extension to IProvideClassInfo2 that makes it faster and easier to retrieve type information from a component that may have multiple coclasses that determine its behavior.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iprovidemultipleclassinfo
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IProvideMultipleClassInfo extends IProvideClassInfo2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProvideMultipleClassInfo
     * @type {Guid}
     */
    static IID => Guid("{a7aba9c1-8983-11cf-8f20-00805f2cd064}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMultiTypeInfoCount", "GetInfoOfIndex"]

    /**
     * Retrieves the number of type information blocks that this object must provide.
     * @returns {Integer} The number of type information blocks that this object must provide.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iprovidemultipleclassinfo-getmultitypeinfocount
     */
    GetMultiTypeInfoCount() {
        result := ComCall(5, this, "uint*", &pcti := 0, "HRESULT")
        return pcti
    }

    /**
     * Retrieves the type information from the specified index.
     * @param {Integer} iti The index of the type information for which you want to obtain information. Index 0 is the default interface of the extender object; index *pcti-1 is the index of the base object.
     * @param {Integer} dwFlags 
     * @param {Pointer<ITypeInfo>} pptiCoClass The <a href="https://msdn.microsoft.com/">coclass</a> type information for the requested contributor. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-itypeinfo">ITypeInfo</a>.
     * @param {Pointer<Integer>} pdwTIFlags The bitfield flag.
     * @param {Pointer<Integer>} pcdispidReserved The mumber of DISPIDs the default interface of <i>pptiCoClass</i> reserves for its own use. This number can be used to calculate the amount to offset DISPIDs in the reserved range implemented by the object this class is extending.
     * @param {Pointer<Guid>} piidPrimary The IID of the primary interface for the requested contributor.
     * @param {Pointer<Guid>} piidSource The IID of the default source interface for the requested contributor.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_POINTER, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//ocidl/nf-ocidl-iprovidemultipleclassinfo-getinfoofindex
     */
    GetInfoOfIndex(iti, dwFlags, pptiCoClass, pdwTIFlags, pcdispidReserved, piidPrimary, piidSource) {
        pdwTIFlagsMarshal := pdwTIFlags is VarRef ? "uint*" : "ptr"
        pcdispidReservedMarshal := pcdispidReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", iti, "uint", dwFlags, "ptr*", pptiCoClass, pdwTIFlagsMarshal, pdwTIFlags, pcdispidReservedMarshal, pcdispidReserved, "ptr", piidPrimary, "ptr", piidSource, "HRESULT")
        return result
    }
}
