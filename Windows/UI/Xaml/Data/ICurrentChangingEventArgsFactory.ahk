#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CurrentChangingEventArgs.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class ICurrentChangingEventArgsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICurrentChangingEventArgsFactory
     * @type {Guid}
     */
    static IID => Guid("{153bbeee-62f3-48cf-8183-8be26de3a66e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "CreateWithCancelableParameter"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {CurrentChangingEventArgs} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(baseInterface, innerInterface) {
        result := ComCall(6, this, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CurrentChangingEventArgs(value)
    }

    /**
     * 
     * @param {Boolean} isCancelable 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {CurrentChangingEventArgs} 
     */
    CreateWithCancelableParameter(isCancelable, baseInterface, innerInterface) {
        result := ComCall(7, this, "int", isCancelable, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CurrentChangingEventArgs(value)
    }
}
