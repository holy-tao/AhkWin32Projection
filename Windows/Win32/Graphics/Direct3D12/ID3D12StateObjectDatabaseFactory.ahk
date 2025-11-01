#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12StateObjectDatabaseFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12StateObjectDatabaseFactory
     * @type {Guid}
     */
    static IID => Guid("{f5b066f0-648a-4611-bd41-27fd0948b9eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateStateObjectDatabaseFromFile"]

    /**
     * 
     * @param {PWSTR} pDatabaseFile 
     * @param {Integer} flags 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvStateObjectDatabase 
     * @returns {HRESULT} 
     */
    CreateStateObjectDatabaseFromFile(pDatabaseFile, flags, riid, ppvStateObjectDatabase) {
        pDatabaseFile := pDatabaseFile is String ? StrPtr(pDatabaseFile) : pDatabaseFile

        result := ComCall(3, this, "ptr", pDatabaseFile, "int", flags, "ptr", riid, "ptr*", ppvStateObjectDatabase, "HRESULT")
        return result
    }
}
