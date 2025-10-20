#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IComponent interface a base class for all derived interfaces such as IMPEG2Component and it describes the general characteristics of a component, which is an elementary stream within the program stream.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IComponent)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-icomponent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IComponent extends IDispatch{
    /**
     * The interface identifier for IComponent
     * @type {Guid}
     */
    static IID => Guid("{1a5576fc-0e19-11d3-9d8e-00c04f72d980}")

    /**
     * The class identifier for Component
     * @type {Guid}
     */
    static CLSID => Guid("{59dc47a8-116c-11d3-9d8e-00c04f72d980}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IComponentType>} CT 
     * @returns {HRESULT} 
     */
    get_Type(CT) {
        result := ComCall(7, this, "ptr", CT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IComponentType>} CT 
     * @returns {HRESULT} 
     */
    put_Type(CT) {
        result := ComCall(8, this, "ptr", CT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} LangID 
     * @returns {HRESULT} 
     */
    get_DescLangID(LangID) {
        result := ComCall(9, this, "int*", LangID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} LangID 
     * @returns {HRESULT} 
     */
    put_DescLangID(LangID) {
        result := ComCall(10, this, "int", LangID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Status 
     * @returns {HRESULT} 
     */
    get_Status(Status) {
        result := ComCall(11, this, "int*", Status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Status 
     * @returns {HRESULT} 
     */
    put_Status(Status) {
        result := ComCall(12, this, "int", Status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Description 
     * @returns {HRESULT} 
     */
    get_Description(Description) {
        result := ComCall(13, this, "ptr", Description, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Description 
     * @returns {HRESULT} 
     */
    put_Description(Description) {
        Description := Description is String ? BSTR.Alloc(Description).Value : Description

        result := ComCall(14, this, "ptr", Description, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IComponent>} NewComponent 
     * @returns {HRESULT} 
     */
    Clone(NewComponent) {
        result := ComCall(15, this, "ptr", NewComponent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
