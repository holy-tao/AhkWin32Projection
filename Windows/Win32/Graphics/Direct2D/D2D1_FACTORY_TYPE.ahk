#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether Direct2D provides synchronization for an ID2D1Factory and the resources it creates, so that they may be safely accessed from multiple threads.
 * @remarks
 * 
  * When you create a factory, you can specify whether it is multithreaded or singlethreaded. A singlethreaded factory provides no serialization against any other single threaded instance within Direct2D, so this mechanism provides a very large degree of scaling on the CPU.
  * 
  * You can also create a multithreaded factory instance. In this case, the factory and all derived objects can be used from any thread, and each render target can be rendered to independently. Direct2D serializes calls to these objects, so a single multithreaded Direct2D instance won't scale as well on the CPU as many single threaded instances. However, the resources can be shared within the multithreaded instance.
  * 
  * Note the qualifier "On the CPU": GPUs generally take advantage of fine-grained parallelism more so than CPUs. For example, multithreaded calls from the CPU might still end up being serialized when being sent to the GPU; however, a whole bank of pixel and vertex shaders will run in parallel to perform the rendering.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ne-d2d1-d2d1_factory_type
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_FACTORY_TYPE{

    /**
     * No synchronization is provided for accessing or writing to the factory or the objects it creates. If the factory or the objects are called from multiple threads, it is up to the application to provide access locking.
     * @type {Integer (Int32)}
     */
    static D2D1_FACTORY_TYPE_SINGLE_THREADED => 0

    /**
     * Direct2D provides synchronization for accessing and writing to the factory and the objects it creates, enabling safe access from multiple threads.
     * @type {Integer (Int32)}
     */
    static D2D1_FACTORY_TYPE_MULTI_THREADED => 1
}
