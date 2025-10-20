#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IGraphVersion interface is implemented on the Filter Graph Manager to provide a way for plug-in distributors and applications to know when the graph has changed.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-igraphversion
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IGraphVersion extends IUnknown{
    /**
     * The interface identifier for IGraphVersion
     * @type {Guid}
     */
    static IID => Guid("{56a868ab-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pVersion 
     * @returns {HRESULT} 
     */
    QueryVersion(pVersion) {
        result := ComCall(3, this, "int*", pVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
