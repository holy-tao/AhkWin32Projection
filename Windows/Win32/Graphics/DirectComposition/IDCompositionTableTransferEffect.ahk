#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The table transfer effect is used to map the color intensities of an image using a transfer function created from interpolating a list of values you provide.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositiontabletransfereffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionTableTransferEffect extends IDCompositionFilterEffect{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionTableTransferEffect
     * @type {Guid}
     */
    static IID => Guid("{9b7e82e2-69c5-4eb4-a5f5-a7033f5132cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRedTable", "SetGreenTable", "SetBlueTable", "SetAlphaTable", "SetRedDisable", "SetGreenDisable", "SetBlueDisable", "SetAlphaDisable", "SetClampOutput", "SetRedTableValue", "SetRedTableValue1", "SetGreenTableValue", "SetGreenTableValue1", "SetBlueTableValue", "SetBlueTableValue1", "SetAlphaTableValue", "SetAlphaTableValue1"]

    /**
     * 
     * @param {Pointer<Float>} tableValues 
     * @param {Integer} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontabletransfereffect-setredtable
     */
    SetRedTable(tableValues, count) {
        tableValuesMarshal := tableValues is VarRef ? "float*" : "ptr"

        result := ComCall(4, this, tableValuesMarshal, tableValues, "uint", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} tableValues 
     * @param {Integer} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontabletransfereffect-setgreentable
     */
    SetGreenTable(tableValues, count) {
        tableValuesMarshal := tableValues is VarRef ? "float*" : "ptr"

        result := ComCall(5, this, tableValuesMarshal, tableValues, "uint", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} tableValues 
     * @param {Integer} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontabletransfereffect-setbluetable
     */
    SetBlueTable(tableValues, count) {
        tableValuesMarshal := tableValues is VarRef ? "float*" : "ptr"

        result := ComCall(6, this, tableValuesMarshal, tableValues, "uint", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} tableValues 
     * @param {Integer} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontabletransfereffect-setalphatable
     */
    SetAlphaTable(tableValues, count) {
        tableValuesMarshal := tableValues is VarRef ? "float*" : "ptr"

        result := ComCall(7, this, tableValuesMarshal, tableValues, "uint", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} redDisable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontabletransfereffect-setreddisable
     */
    SetRedDisable(redDisable) {
        result := ComCall(8, this, "int", redDisable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} greenDisable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontabletransfereffect-setgreendisable
     */
    SetGreenDisable(greenDisable) {
        result := ComCall(9, this, "int", greenDisable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} blueDisable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontabletransfereffect-setbluedisable
     */
    SetBlueDisable(blueDisable) {
        result := ComCall(10, this, "int", blueDisable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} alphaDisable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontabletransfereffect-setalphadisable
     */
    SetAlphaDisable(alphaDisable) {
        result := ComCall(11, this, "int", alphaDisable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} clampOutput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontabletransfereffect-setclampoutput
     */
    SetClampOutput(clampOutput) {
        result := ComCall(12, this, "int", clampOutput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontabletransfereffect-setredtablevalue(uint_idcompositionanimation)
     */
    SetRedTableValue(index, animation) {
        result := ComCall(13, this, "uint", index, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Float} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontabletransfereffect-setredtablevalue(uint_idcompositionanimation)
     */
    SetRedTableValue1(index, value) {
        result := ComCall(14, this, "uint", index, "float", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontabletransfereffect-setgreentablevalue(uint_idcompositionanimation)
     */
    SetGreenTableValue(index, animation) {
        result := ComCall(15, this, "uint", index, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Float} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontabletransfereffect-setgreentablevalue(uint_idcompositionanimation)
     */
    SetGreenTableValue1(index, value) {
        result := ComCall(16, this, "uint", index, "float", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontabletransfereffect-setbluetablevalue(uint_idcompositionanimation)
     */
    SetBlueTableValue(index, animation) {
        result := ComCall(17, this, "uint", index, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Float} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontabletransfereffect-setbluetablevalue(uint_idcompositionanimation)
     */
    SetBlueTableValue1(index, value) {
        result := ComCall(18, this, "uint", index, "float", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontabletransfereffect-setalphatablevalue(uint_idcompositionanimation)
     */
    SetAlphaTableValue(index, animation) {
        result := ComCall(19, this, "uint", index, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Float} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositiontabletransfereffect-setalphatablevalue(uint_idcompositionanimation)
     */
    SetAlphaTableValue1(index, value) {
        result := ComCall(20, this, "uint", index, "float", value, "HRESULT")
        return result
    }
}
