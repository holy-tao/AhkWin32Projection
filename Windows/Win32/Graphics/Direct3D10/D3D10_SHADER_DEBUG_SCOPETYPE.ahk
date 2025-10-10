#Requires AutoHotkey v2.0.0 64-bit

/**
 * Scope types.
 * @remarks
 * 
  * The <b>D3D10_SHADER_DEBUG_SCOPETYPE</b> enumeration is used to specify scope type in the <a href="https://docs.microsoft.com/windows/win32/api/d3d10_1shader/ns-d3d10_1shader-d3d10_shader_debug_scope_info">D3D10_SHADER_DEBUG_SCOPE_INFO</a> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10_1shader/ne-d3d10_1shader-d3d10_shader_debug_scopetype
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_SHADER_DEBUG_SCOPETYPE{

    /**
     * Global scope.
     * @type {Integer (Int32)}
     */
    static D3D10_SHADER_DEBUG_SCOPE_GLOBAL => 0

    /**
     * Block scope.
     * @type {Integer (Int32)}
     */
    static D3D10_SHADER_DEBUG_SCOPE_BLOCK => 1

    /**
     * For loop scope.
     * @type {Integer (Int32)}
     */
    static D3D10_SHADER_DEBUG_SCOPE_FORLOOP => 2

    /**
     * Structure scope.
     * @type {Integer (Int32)}
     */
    static D3D10_SHADER_DEBUG_SCOPE_STRUCT => 3

    /**
     * Function parameter scope.
     * @type {Integer (Int32)}
     */
    static D3D10_SHADER_DEBUG_SCOPE_FUNC_PARAMS => 4

    /**
     * State block scope.
     * @type {Integer (Int32)}
     */
    static D3D10_SHADER_DEBUG_SCOPE_STATEBLOCK => 5

    /**
     * Name space scope.
     * @type {Integer (Int32)}
     */
    static D3D10_SHADER_DEBUG_SCOPE_NAMESPACE => 6

    /**
     * Annotation scope.
     * @type {Integer (Int32)}
     */
    static D3D10_SHADER_DEBUG_SCOPE_ANNOTATION => 7
}
