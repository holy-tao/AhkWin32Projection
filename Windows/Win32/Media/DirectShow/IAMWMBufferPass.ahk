#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMWMBufferPass interface is implemented on the output pins of the WM ASF Reader and the input pins of the WM ASF Writer.
 * @see https://docs.microsoft.com/windows/win32/api//dshowasf/nn-dshowasf-iamwmbufferpass
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMWMBufferPass extends IUnknown{
    /**
     * The interface identifier for IAMWMBufferPass
     * @type {Guid}
     */
    static IID => Guid("{6dd816d7-e740-4123-9e24-2444412644d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IAMWMBufferPassCallback>} pCallback 
     * @returns {HRESULT} 
     */
    SetNotify(pCallback) {
        result := ComCall(3, this, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
