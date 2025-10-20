#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables clients to subscribe to type change notifications on objects that implement the ITypeInfo, ITypeInfo2, ICreateTypeInfo, and ICreateTypeInfo2 interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-itypechangeevents
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ITypeChangeEvents extends IUnknown{
    /**
     * The interface identifier for ITypeChangeEvents
     * @type {Guid}
     */
    static IID => Guid("{00020410-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} changeKind 
     * @param {Pointer<ITypeInfo>} pTInfoBefore 
     * @param {PWSTR} pStrName 
     * @param {Pointer<Int32>} pfCancel 
     * @returns {HRESULT} 
     */
    RequestTypeChange(changeKind, pTInfoBefore, pStrName, pfCancel) {
        pStrName := pStrName is String ? StrPtr(pStrName) : pStrName

        result := ComCall(3, this, "int", changeKind, "ptr", pTInfoBefore, "ptr", pStrName, "int*", pfCancel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} changeKind 
     * @param {Pointer<ITypeInfo>} pTInfoAfter 
     * @param {PWSTR} pStrName 
     * @returns {HRESULT} 
     */
    AfterTypeChange(changeKind, pTInfoAfter, pStrName) {
        pStrName := pStrName is String ? StrPtr(pStrName) : pStrName

        result := ComCall(4, this, "int", changeKind, "ptr", pTInfoAfter, "ptr", pStrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
