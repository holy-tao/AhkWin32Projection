#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INSSBuffer2.ahk

/**
 * The INSSBuffer3 interface enhances the INSSBuffer interface by adding the ability to set and retrieve single properties for a sample.
 * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nn-wmsbuffer-inssbuffer3
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class INSSBuffer3 extends INSSBuffer2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INSSBuffer3
     * @type {Guid}
     */
    static IID => Guid("{c87ceaaf-75be-4bc4-84eb-ac2798507672}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProperty", "GetProperty"]

    /**
     * 
     * @param {Guid} guidBufferProperty 
     * @param {Pointer<Void>} pvBufferProperty 
     * @param {Integer} dwBufferPropertySize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer3-setproperty
     */
    SetProperty(guidBufferProperty, pvBufferProperty, dwBufferPropertySize) {
        pvBufferPropertyMarshal := pvBufferProperty is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "ptr", guidBufferProperty, pvBufferPropertyMarshal, pvBufferProperty, "uint", dwBufferPropertySize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} guidBufferProperty 
     * @param {Pointer<Void>} pvBufferProperty 
     * @param {Pointer<Integer>} pdwBufferPropertySize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer3-getproperty
     */
    GetProperty(guidBufferProperty, pvBufferProperty, pdwBufferPropertySize) {
        pvBufferPropertyMarshal := pvBufferProperty is VarRef ? "ptr" : "ptr"
        pdwBufferPropertySizeMarshal := pdwBufferPropertySize is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", guidBufferProperty, pvBufferPropertyMarshal, pvBufferProperty, pdwBufferPropertySizeMarshal, pdwBufferPropertySize, "HRESULT")
        return result
    }
}
