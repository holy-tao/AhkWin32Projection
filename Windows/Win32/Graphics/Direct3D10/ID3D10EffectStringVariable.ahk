#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10EffectVariable.ahk

/**
 * A string-variable interface accesses a string variable.
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectstringvariable
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectStringVariable extends ID3D10EffectVariable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10EffectStringVariable
     * @type {Guid}
     */
    static IID => Guid("{71417501-8df9-4e0a-a78a-255f9756baff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetString", "GetStringArray"]

    /**
     * 
     * @returns {PSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectstringvariable-getstring
     */
    GetString() {
        result := ComCall(25, this, "ptr*", &ppString := 0, "HRESULT")
        return ppString
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Count 
     * @returns {PSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectstringvariable-getstringarray
     */
    GetStringArray(Offset, Count) {
        result := ComCall(26, this, "ptr*", &ppStrings := 0, "uint", Offset, "uint", Count, "HRESULT")
        return ppStrings
    }
}
