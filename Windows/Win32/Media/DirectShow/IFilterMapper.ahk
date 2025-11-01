#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface has been deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ifiltermapper
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFilterMapper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFilterMapper
     * @type {Guid}
     */
    static IID => Guid("{56a868a3-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterFilter", "RegisterFilterInstance", "RegisterPin", "RegisterPinType", "UnregisterFilter", "UnregisterFilterInstance", "UnregisterPin", "EnumMatchingFilters"]

    /**
     * 
     * @param {Guid} clsid 
     * @param {PWSTR} Name 
     * @param {Integer} dwMerit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper-registerfilter
     */
    RegisterFilter(clsid, Name, dwMerit) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(3, this, "ptr", clsid, "ptr", Name, "uint", dwMerit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} clsid 
     * @param {PWSTR} Name 
     * @param {Pointer<Guid>} MRId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper-registerfilterinstance
     */
    RegisterFilterInstance(clsid, Name, MRId) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(4, this, "ptr", clsid, "ptr", Name, "ptr", MRId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Filter 
     * @param {PWSTR} Name 
     * @param {BOOL} bRendered 
     * @param {BOOL} bOutput 
     * @param {BOOL} bZero 
     * @param {BOOL} bMany 
     * @param {Guid} ConnectsToFilter 
     * @param {PWSTR} ConnectsToPin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper-registerpin
     */
    RegisterPin(Filter, Name, bRendered, bOutput, bZero, bMany, ConnectsToFilter, ConnectsToPin) {
        Name := Name is String ? StrPtr(Name) : Name
        ConnectsToPin := ConnectsToPin is String ? StrPtr(ConnectsToPin) : ConnectsToPin

        result := ComCall(5, this, "ptr", Filter, "ptr", Name, "int", bRendered, "int", bOutput, "int", bZero, "int", bMany, "ptr", ConnectsToFilter, "ptr", ConnectsToPin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} clsFilter 
     * @param {PWSTR} strName 
     * @param {Guid} clsMajorType 
     * @param {Guid} clsSubType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper-registerpintype
     */
    RegisterPinType(clsFilter, strName, clsMajorType, clsSubType) {
        strName := strName is String ? StrPtr(strName) : strName

        result := ComCall(6, this, "ptr", clsFilter, "ptr", strName, "ptr", clsMajorType, "ptr", clsSubType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Filter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper-unregisterfilter
     */
    UnregisterFilter(Filter) {
        result := ComCall(7, this, "ptr", Filter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} MRId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper-unregisterfilterinstance
     */
    UnregisterFilterInstance(MRId) {
        result := ComCall(8, this, "ptr", MRId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} Filter 
     * @param {PWSTR} Name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper-unregisterpin
     */
    UnregisterPin(Filter, Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(9, this, "ptr", Filter, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumRegFilters>} ppEnum 
     * @param {Integer} dwMerit 
     * @param {BOOL} bInputNeeded 
     * @param {Guid} clsInMaj 
     * @param {Guid} clsInSub 
     * @param {BOOL} bRender 
     * @param {BOOL} bOututNeeded 
     * @param {Guid} clsOutMaj 
     * @param {Guid} clsOutSub 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ifiltermapper-enummatchingfilters
     */
    EnumMatchingFilters(ppEnum, dwMerit, bInputNeeded, clsInMaj, clsInSub, bRender, bOututNeeded, clsOutMaj, clsOutSub) {
        result := ComCall(10, this, "ptr*", ppEnum, "uint", dwMerit, "int", bInputNeeded, "ptr", clsInMaj, "ptr", clsInSub, "int", bRender, "int", bOututNeeded, "ptr", clsOutMaj, "ptr", clsOutSub, "HRESULT")
        return result
    }
}
