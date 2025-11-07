#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IProvideClassInfo.ahk

/**
 * An extension to IProvideClassInfo that makes is faster and easier to retrieve an object's outgoing interface IID for its default event set.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-iprovideclassinfo2
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IProvideClassInfo2 extends IProvideClassInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProvideClassInfo2
     * @type {Guid}
     */
    static IID => Guid("{a6bc3ac0-dbaa-11ce-9de3-00aa004bb851}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGUID"]

    /**
     * 
     * @param {Integer} dwGuidKind 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iprovideclassinfo2-getguid
     */
    GetGUID(dwGuidKind) {
        pGUID := Guid()
        result := ComCall(4, this, "uint", dwGuidKind, "ptr", pGUID, "HRESULT")
        return pGUID
    }
}
