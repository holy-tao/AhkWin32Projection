#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICreateTypeInfo.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the methods for creating and managing the component or file that contains type information.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-icreatetypelib
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ICreateTypeLib extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreateTypeLib
     * @type {Guid}
     */
    static IID => Guid("{00020406-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTypeInfo", "SetName", "SetVersion", "SetGuid", "SetDocString", "SetHelpFileName", "SetHelpContext", "SetLcid", "SetLibFlags", "SaveAllChanges"]

    /**
     * 
     * @param {PWSTR} szName 
     * @param {Integer} tkind 
     * @returns {ICreateTypeInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-createtypeinfo
     */
    CreateTypeInfo(szName, tkind) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(3, this, "ptr", szName, "int", tkind, "ptr*", &ppCTInfo := 0, "HRESULT")
        return ICreateTypeInfo(ppCTInfo)
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-setname
     */
    SetName(szName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(4, this, "ptr", szName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wMajorVerNum 
     * @param {Integer} wMinorVerNum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-setversion
     */
    SetVersion(wMajorVerNum, wMinorVerNum) {
        result := ComCall(5, this, "ushort", wMajorVerNum, "ushort", wMinorVerNum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-setguid
     */
    SetGuid(guid) {
        result := ComCall(6, this, "ptr", guid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szDoc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-setdocstring
     */
    SetDocString(szDoc) {
        szDoc := szDoc is String ? StrPtr(szDoc) : szDoc

        result := ComCall(7, this, "ptr", szDoc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szHelpFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-sethelpfilename
     */
    SetHelpFileName(szHelpFileName) {
        szHelpFileName := szHelpFileName is String ? StrPtr(szHelpFileName) : szHelpFileName

        result := ComCall(8, this, "ptr", szHelpFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwHelpContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-sethelpcontext
     */
    SetHelpContext(dwHelpContext) {
        result := ComCall(9, this, "uint", dwHelpContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-setlcid
     */
    SetLcid(lcid) {
        result := ComCall(10, this, "uint", lcid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uLibFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-setlibflags
     */
    SetLibFlags(uLibFlags) {
        result := ComCall(11, this, "uint", uLibFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypelib-saveallchanges
     */
    SaveAllChanges() {
        result := ComCall(12, this, "HRESULT")
        return result
    }
}
