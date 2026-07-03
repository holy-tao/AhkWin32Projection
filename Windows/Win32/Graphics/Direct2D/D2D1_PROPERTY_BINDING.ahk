#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Defines a property binding to a pair of functions which get and set the corresponding property.
 * @remarks
 * The <b>propertyName</b> is used to cross-correlate the property binding with the registration XML. The <b>propertyName</b> must be present in the XML call or the registration will fail.
 * 
 * 
 * 
 * All properties must be bound.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_property_binding
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_PROPERTY_BINDING {
    #StructPack 8

    /**
     * The name of the property.
     */
    propertyName : PWSTR

    /**
     * The function that will receive the data to set.
     */
    setFunction : IntPtr

    /**
     * The function that will be asked to write the output data.
     */
    getFunction : IntPtr

}
