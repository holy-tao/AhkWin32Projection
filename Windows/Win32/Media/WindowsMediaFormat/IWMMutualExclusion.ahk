#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMStreamList.ahk

/**
 * The IWMMutualExclusion interface represents a group of streams, of which only one at a time can be played.IWMMutualExclusion is the base interface for mutual exclusion objects.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmmutualexclusion
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMMutualExclusion extends IWMStreamList{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMMutualExclusion
     * @type {Guid}
     */
    static IID => Guid("{96406bde-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "SetType"]

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmutualexclusion-gettype
     */
    GetType() {
        pguidType := Guid()
        result := ComCall(6, this, "ptr", pguidType, "HRESULT")
        return pguidType
    }

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmutualexclusion-settype
     */
    SetType(guidType) {
        result := ComCall(7, this, "ptr", guidType, "HRESULT")
        return result
    }
}
