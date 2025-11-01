#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IToc interface represents an individual table of contents. It provides methods for adding entries to, and removing entries from the table of contents.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-itoc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IToc extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToc
     * @type {Guid}
     */
    static IID => Guid("{d6f05441-a919-423b-91a0-89d5b4a8ab77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDescriptor", "GetDescriptor", "SetDescription", "GetDescription", "SetContext", "GetContext", "GetEntryListCount", "GetEntryListByIndex", "AddEntryList", "AddEntryListByIndex", "RemoveEntryListByIndex"]

    /**
     * 
     * @param {Pointer<TOC_DESCRIPTOR>} pDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-setdescriptor
     */
    SetDescriptor(pDescriptor) {
        result := ComCall(3, this, "ptr", pDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TOC_DESCRIPTOR>} pDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-getdescriptor
     */
    GetDescriptor(pDescriptor) {
        result := ComCall(4, this, "ptr", pDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-setdescription
     */
    SetDescription(pwszDescription) {
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        result := ComCall(5, this, "ptr", pwszDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwDescriptionSize 
     * @param {PWSTR} pwszDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-getdescription
     */
    GetDescription(pwDescriptionSize, pwszDescription) {
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        result := ComCall(6, this, "ushort*", pwDescriptionSize, "ptr", pwszDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwContextSize 
     * @param {Pointer<Integer>} pbtContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-setcontext
     */
    SetContext(dwContextSize, pbtContext) {
        result := ComCall(7, this, "uint", dwContextSize, "char*", pbtContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwContextSize 
     * @param {Pointer<Integer>} pbtContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-getcontext
     */
    GetContext(pdwContextSize, pbtContext) {
        result := ComCall(8, this, "uint*", pdwContextSize, "char*", pbtContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-getentrylistcount
     */
    GetEntryListCount(pwCount) {
        result := ComCall(9, this, "ushort*", pwCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wEntryListIndex 
     * @param {Pointer<ITocEntryList>} ppEntryList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-getentrylistbyindex
     */
    GetEntryListByIndex(wEntryListIndex, ppEntryList) {
        result := ComCall(10, this, "ushort", wEntryListIndex, "ptr*", ppEntryList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITocEntryList} pEntryList 
     * @param {Pointer<Integer>} pwEntryListIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-addentrylist
     */
    AddEntryList(pEntryList, pwEntryListIndex) {
        result := ComCall(11, this, "ptr", pEntryList, "ushort*", pwEntryListIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wEntryListIndex 
     * @param {ITocEntryList} pEntryList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-addentrylistbyindex
     */
    AddEntryListByIndex(wEntryListIndex, pEntryList) {
        result := ComCall(12, this, "ushort", wEntryListIndex, "ptr", pEntryList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wEntryListIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoc-removeentrylistbyindex
     */
    RemoveEntryListByIndex(wEntryListIndex) {
        result := ComCall(13, this, "ushort", wEntryListIndex, "HRESULT")
        return result
    }
}
