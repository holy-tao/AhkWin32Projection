#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The base interface for sharable interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/nn-xpsobjectmodel-ixpsomshareable
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsOMShareable extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsOMShareable
     * @type {Guid}
     */
    static IID => Guid("{7137398f-2fc1-454d-8c6a-2c3115a16ece}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOwner", "GetType"]

    /**
     * 
     * @param {Pointer<IUnknown>} owner 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomshareable-getowner
     */
    GetOwner(owner) {
        result := ComCall(3, this, "ptr*", owner, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/nf-xpsobjectmodel-ixpsomshareable-gettype
     */
    GetType(type) {
        typeMarshal := type is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, typeMarshal, type, "HRESULT")
        return result
    }
}
