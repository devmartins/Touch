using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Touch
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length > 0 && File.Exists(args[0]))
            {
                var dataEscrita = File.GetLastWriteTime(args[0]);

                Console.WriteLine($"Arquivo: {args[0]} Ultimo Acesso: {dataEscrita}");

                File.SetLastWriteTime(args[0], DateTime.Now);
            }
        }
    }
}
