#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Heap.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Heap1 extends ID3D12Heap{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Heap1
     * @type {Guid}
     */
    static IID => Guid("{572f7389-2168-49e3-9693-d6df5871bf6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProtectedResourceSession"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppProtectedSession 
     * @returns {HRESULT} 
     */
    GetProtectedResourceSession(riid, ppProtectedSession) {
        ppProtectedSessionMarshal := ppProtectedSession is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", riid, ppProtectedSessionMarshal, ppProtectedSession, "HRESULT")
        return result
    }
}
