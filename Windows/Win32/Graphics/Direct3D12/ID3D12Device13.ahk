#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device12.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device13 extends ID3D12Device12{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Device13
     * @type {Guid}
     */
    static IID => Guid("{14eecffc-4df8-40f7-a118-5c816f45695e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 81

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenExistingHeapFromAddress1"]

    /**
     * 
     * @param {Pointer<Void>} pAddress 
     * @param {Pointer} size 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvHeap 
     * @returns {HRESULT} 
     */
    OpenExistingHeapFromAddress1(pAddress, size, riid, ppvHeap) {
        result := ComCall(81, this, "ptr", pAddress, "ptr", size, "ptr", riid, "ptr*", ppvHeap, "HRESULT")
        return result
    }
}
