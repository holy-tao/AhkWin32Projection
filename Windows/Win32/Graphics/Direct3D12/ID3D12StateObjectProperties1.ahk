#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12StateObjectProperties.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12StateObjectProperties1 extends ID3D12StateObjectProperties{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12StateObjectProperties1
     * @type {Guid}
     */
    static IID => Guid("{460caac7-1d24-446a-a184-ca67db494138}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProgramIdentifier"]

    /**
     * 
     * @param {PWSTR} pProgramName 
     * @returns {D3D12_PROGRAM_IDENTIFIER} 
     */
    GetProgramIdentifier(pProgramName) {
        pProgramName := pProgramName is String ? StrPtr(pProgramName) : pProgramName

        result := ComCall(7, this, "ptr", pProgramName, "ptr")
        return result
    }
}
