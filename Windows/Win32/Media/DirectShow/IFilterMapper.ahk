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
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {PWSTR} Name 
     * @param {Integer} dwMerit 
     * @returns {HRESULT} 
     */
    RegisterFilter(clsid, Name, dwMerit) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(3, this, "ptr", clsid, "ptr", Name, "uint", dwMerit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {PWSTR} Name 
     * @param {Pointer<Guid>} MRId 
     * @returns {HRESULT} 
     */
    RegisterFilterInstance(clsid, Name, MRId) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(4, this, "ptr", clsid, "ptr", Name, "ptr", MRId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Filter 
     * @param {PWSTR} Name 
     * @param {BOOL} bRendered 
     * @param {BOOL} bOutput 
     * @param {BOOL} bZero 
     * @param {BOOL} bMany 
     * @param {Pointer<Guid>} ConnectsToFilter 
     * @param {PWSTR} ConnectsToPin 
     * @returns {HRESULT} 
     */
    RegisterPin(Filter, Name, bRendered, bOutput, bZero, bMany, ConnectsToFilter, ConnectsToPin) {
        Name := Name is String ? StrPtr(Name) : Name
        ConnectsToPin := ConnectsToPin is String ? StrPtr(ConnectsToPin) : ConnectsToPin

        result := ComCall(5, this, "ptr", Filter, "ptr", Name, "int", bRendered, "int", bOutput, "int", bZero, "int", bMany, "ptr", ConnectsToFilter, "ptr", ConnectsToPin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsFilter 
     * @param {PWSTR} strName 
     * @param {Pointer<Guid>} clsMajorType 
     * @param {Pointer<Guid>} clsSubType 
     * @returns {HRESULT} 
     */
    RegisterPinType(clsFilter, strName, clsMajorType, clsSubType) {
        strName := strName is String ? StrPtr(strName) : strName

        result := ComCall(6, this, "ptr", clsFilter, "ptr", strName, "ptr", clsMajorType, "ptr", clsSubType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Filter 
     * @returns {HRESULT} 
     */
    UnregisterFilter(Filter) {
        result := ComCall(7, this, "ptr", Filter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} MRId 
     * @returns {HRESULT} 
     */
    UnregisterFilterInstance(MRId) {
        result := ComCall(8, this, "ptr", MRId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Filter 
     * @param {PWSTR} Name 
     * @returns {HRESULT} 
     */
    UnregisterPin(Filter, Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(9, this, "ptr", Filter, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumRegFilters>} ppEnum 
     * @param {Integer} dwMerit 
     * @param {BOOL} bInputNeeded 
     * @param {Pointer<Guid>} clsInMaj 
     * @param {Pointer<Guid>} clsInSub 
     * @param {BOOL} bRender 
     * @param {BOOL} bOututNeeded 
     * @param {Pointer<Guid>} clsOutMaj 
     * @param {Pointer<Guid>} clsOutSub 
     * @returns {HRESULT} 
     */
    EnumMatchingFilters(ppEnum, dwMerit, bInputNeeded, clsInMaj, clsInSub, bRender, bOututNeeded, clsOutMaj, clsOutSub) {
        result := ComCall(10, this, "ptr", ppEnum, "uint", dwMerit, "int", bInputNeeded, "ptr", clsInMaj, "ptr", clsInSub, "int", bRender, "int", bOututNeeded, "ptr", clsOutMaj, "ptr", clsOutSub, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
