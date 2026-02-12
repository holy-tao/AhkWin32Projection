#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DisplayPrimaryDescription.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayPrimaryDescriptionFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayPrimaryDescriptionFactory
     * @type {Guid}
     */
    static IID => Guid("{1a6aff7b-3637-5c46-b479-76d576216e65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Integer} pixelFormat 
     * @param {Integer} colorSpace 
     * @param {Boolean} isStereo 
     * @param {Direct3DMultisampleDescription} multisampleDescription 
     * @returns {DisplayPrimaryDescription} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(width, height, pixelFormat, colorSpace, isStereo, multisampleDescription) {
        result := ComCall(6, this, "uint", width, "uint", height, "int", pixelFormat, "int", colorSpace, "int", isStereo, "ptr", multisampleDescription, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DisplayPrimaryDescription(value)
    }
}
