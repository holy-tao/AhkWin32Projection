#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IPersistFile.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class IAVIPersistFile extends IPersistFile{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAVIPersistFile
     * @type {Guid}
     */
    static IID => Guid("{00020025-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reserved1"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Reserved1() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
