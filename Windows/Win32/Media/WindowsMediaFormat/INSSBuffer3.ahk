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
     * 
     * @param {Pointer<Guid>} guidBufferProperty 
     * @param {Pointer<Void>} pvBufferProperty 
     * @param {Integer} dwBufferPropertySize 
     * @returns {HRESULT} 
     */
    SetProperty(guidBufferProperty, pvBufferProperty, dwBufferPropertySize) {
        result := ComCall(10, this, "ptr", guidBufferProperty, "ptr", pvBufferProperty, "uint", dwBufferPropertySize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidBufferProperty 
     * @param {Pointer<Void>} pvBufferProperty 
     * @param {Pointer<UInt32>} pdwBufferPropertySize 
     * @returns {HRESULT} 
     */
    GetProperty(guidBufferProperty, pvBufferProperty, pdwBufferPropertySize) {
        result := ComCall(11, this, "ptr", guidBufferProperty, "ptr", pvBufferProperty, "uint*", pdwBufferPropertySize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
