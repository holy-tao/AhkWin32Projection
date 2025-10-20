#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMInterlaceProps extends IUnknown{
    /**
     * The interface identifier for IWMInterlaceProps
     * @type {Guid}
     */
    static IID => Guid("{7b12e5d1-bd22-48ea-bc06-98e893221c89}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} iProcessType 
     * @returns {HRESULT} 
     */
    SetProcessType(iProcessType) {
        result := ComCall(3, this, "int", iProcessType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iInitPattern 
     * @returns {HRESULT} 
     */
    SetInitInverseTeleCinePattern(iInitPattern) {
        result := ComCall(4, this, "int", iInitPattern, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetLastFrame() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
