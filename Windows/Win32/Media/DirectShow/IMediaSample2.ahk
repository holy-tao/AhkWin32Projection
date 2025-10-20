#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMediaSample.ahk

/**
 * The IMediaSample2 interface sets and retrieves properties on media samples.This interface inherits the IMediaSample interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imediasample2
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaSample2 extends IMediaSample{
    /**
     * The interface identifier for IMediaSample2
     * @type {Guid}
     */
    static IID => Guid("{36b73884-c2c8-11cf-8b46-00805f6cef60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * 
     * @param {Integer} cbProperties 
     * @param {Pointer} pbProperties 
     * @returns {HRESULT} 
     */
    GetProperties(cbProperties, pbProperties) {
        result := ComCall(19, this, "uint", cbProperties, "ptr", pbProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbProperties 
     * @param {Pointer} pbProperties 
     * @returns {HRESULT} 
     */
    SetProperties(cbProperties, pbProperties) {
        result := ComCall(20, this, "uint", cbProperties, "ptr", pbProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
