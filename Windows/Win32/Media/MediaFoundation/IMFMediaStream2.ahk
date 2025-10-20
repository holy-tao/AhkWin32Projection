#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaStream.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaStream2 extends IMFMediaStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaStream2
     * @type {Guid}
     */
    static IID => Guid("{c5bc37d6-75c7-46a1-a132-81b5f723c20f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetStreamState", "GetStreamState"]

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    SetStreamState(value) {
        result := ComCall(10, this, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    GetStreamState(value) {
        result := ComCall(11, this, "int*", value, "HRESULT")
        return result
    }
}
