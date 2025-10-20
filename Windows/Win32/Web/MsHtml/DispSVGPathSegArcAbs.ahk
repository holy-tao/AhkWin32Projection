#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class DispSVGPathSegArcAbs extends IDispatch{
    /**
     * The interface identifier for DispSVGPathSegArcAbs
     * @type {Guid}
     */
    static IID => Guid("{30590013-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DispSVGPathSegArcAbs
     * @type {Guid}
     */
    static CLSID => Guid("{30590013-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7
}
